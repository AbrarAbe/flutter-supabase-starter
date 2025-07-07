# Supabase Configuration Example

This document outlines the essential Supabase configurations, including Row-Level Security (RLS) policies and Storage setup, for the your application.

## 1. Database Schema

To begin, you'll need to define your database schema within your Supabase project. This involves creating the tables necessary to store your application's data. You can either use the Supabase UI or manually create the tables using SQL.

**Using the Supabase UI:**

Navigate to the Supabase dashboard, and follow these steps:

1.  **Create a new project:** If you haven't already, create a new project.

2.  **Access the Table Editor:** Once your project is set up, go to the Table Editor in the Supabase dashboard. This allows you to visually design and create your tables.

3.  **Define Tables:** Use the UI to create tables, define columns, set data types, primary keys, foreign keys, and constraints.

**Using the SQL Editor (Manual Creation):**

1.  **Access the SQL Editor:** Once your project is set up, go to the SQL Editor in the Supabase dashboard. This is where you will execute SQL commands to define your tables.

2.  **Write SQL `CREATE TABLE` statements:** Carefully design your tables based on your data model. The SQL code below provides an example for user profiles, but you should adapt it to fit your specific application needs. Pay close attention to data types, primary keys, foreign keys, and any constraints.

3.  **Run SQL scripts:** Copy and paste the SQL scripts provided below (or your own custom scripts) into the SQL Editor.

4.  **Execute:** Click the "Run" button to execute the SQL statements and create your tables.

The following SQL commands create the necessary tables for user profiles and their associated data.
```sql
CREATE TABLE IF NOT EXISTS profiles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES auth.users ON DELETE CASCADE,
    username text UNIQUE NOT NULL,
    profile_picture_url text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
```

## 2. Row-Level Security (RLS) Policies

RLS is crucial for securing your database tables. By default, RLS is enabled on new tables, restricting all access until policies are defined.

### `profiles` Table Policies

| Policy Name                         | Command | Target Roles | Using expression (SELECT/UPDATE/DELETE) | With Check expression (INSERT/UPDATE) | Description                                         |
| :---------------------------------- | :------ | :----------- | :-------------------------------------- | :------------------------------------ | :-------------------------------------------------- |
| `Allow self insert`                 | `INSERT`| `authenticated`| `true`                                  | `auth.uid() = id`                     | Allows authenticated users to create their own profile entry, linking it to their `auth.uid()`. |
| `Allow self update`                 | `UPDATE`| `authenticated`| `auth.uid() = id`                       | `auth.uid() = id`                     | Allows authenticated users to update their own profile. |
| `Allow public read all profiles`    | `SELECT`| `authenticated`| `true`                                  | `true`                                | Allows all authenticated users to view any profile (username, profile picture URL). |
| `Allow self delete` (Optional)      | `DELETE`| `authenticated`| `auth.uid() = id`                       | `true`                                | Allows users to delete their own profile (use with caution). |

SQL Querry for profiles table policies:
```sql
CREATE POLICY "Allow authenticated users to select their own profile"
ON profiles
FOR SELECT
TO authenticated
USING ((select auth.uid()) = user_id);

CREATE POLICY "Allow authenticated users to insert a profile"
ON profiles
FOR INSERT
TO authenticated
WITH CHECK (true);

CREATE POLICY "Allow authenticated users to update their own profile"
ON profiles
FOR UPDATE
TO authenticated
USING ((select auth.uid()) = user_id)
WITH CHECK (true);

CREATE POLICY "Allow authenticated users to delete their own profile"
ON profiles
FOR DELETE
TO authenticated
USING ((select auth.uid()) = user_id);
```

## 3. Storage Buckets Example

Supabase Storage is used for file uploads, such as profile pictures.

### `profile_pictures` Bucket Example

*   **Name:** `profile_pictures`
*   **Public Access:** Consider if this bucket should be public or if images should be served via signed URLs. For typical profile pictures, making the bucket public is often acceptable for easier display, but ensure you have appropriate RLS policies on the bucket itself.

**Storage Bucket RLS Policy (Example for `profile_pictures`):**

To allow authenticated users to upload to and read from the `profile_pictures` bucket:

| Policy Name                         | Bucket Name          | Operation | Target Paths                  | User ID | Roles           | Condition                                       |
| :---------------------------------- | :------------------- | :-------- | :---------------------------- | :------ | :-------------- | :---------------------------------------------- |
| `Allow authenticated upload`        | `profile_pictures`   | `INSERT`  | `users/{user_id}/avatar.*`    | `auth.uid()` | `authenticated` | `true` (users can insert their own path)      |
| `Allow authenticated read`          | `profile_pictures`   | `SELECT`  | `users/{user_id}/avatar.*`    | `auth.uid()` | `authenticated` | `true` (users can read any profile pic)         |
| `Allow self delete`                 | `profile_pictures`   | `DELETE`  | `users/{user_id}/avatar.*`    | `auth.uid()` | `authenticated` | `true` (users can delete their own profile pic) |

-- Assuming you want to allow only authenticated users to upload, view and delete their own profile pictures.
-- Replace 'profile_pictures' with your actual bucket name.

-- Allow authenticated users to upload their own profile pictures
CREATE POLICY "Allow authenticated upload"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'profile_pictures' AND startswith(name, 'users/' || auth.uid() || '/'));

-- Allow authenticated users to view all profile pictures
CREATE POLICY "Allow authenticated read"
ON storage.objects
FOR SELECT
TO authenticated
USING (bucket_id = 'profile_pictures');

-- Allow authenticated users to delete their own profile pictures
CREATE POLICY "Allow authenticated delete"
ON storage.objects
FOR DELETE
TO authenticated
USING (bucket_id = 'profile_pictures' AND startswith(name, 'users/' || auth.uid() || '/'));

```

*Note: For `Target Paths` in Storage policies, you'd typically structure paths like `users/<user_id>/<filename>`, allowing you to apply policies based on the user's UID.*
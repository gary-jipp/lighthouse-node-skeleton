LHL Node Skeleton
=========

## Project Setup

The following steps are only for _one_ of the group members to perform.

1. Create your own copy of this repo using the `Use This Template` button, ideally using the name of your project. The repo should be marked Public
2. Verify that the skeleton code now shows up in your repo on GitHub, you should be automatically redirected
3. Clone your copy of the repo to your dev machine
4. Add your team members as collaborators to the project so that they can push to this repo
5. Let your team members know the repo URL so that they use the same repo (they should _not_ create a copy or a fork of this repo since that will add additional workflow complexity to the project)

Note: this project has been modified to make it easier to deploy on multiple platforms.  It requires less dependencies than the original.

## Getting Started

1. Create a "labber" user in postgres: 
``` sql
CREATE ROLE labber LOGIN PASSWORD 'labber';
```
2. Create and load the midterm database using psql:
  ``` bash
  psql midterm < db/midterm_data.sql
  ```

3. Create the `.env` by using `.env.example` as a reference: 
  ``` bash
cp .env.example .env
```
4. Update the .env file with your correct local information 
  - username: `labber` 
  - password: `labber` 
  - database: `midterm`
5. Install dependencies: `npm i`
6. Run the server: `npm start`
  - Note: nodemon is used, so you should not have to restart your server
7. Visit `http://localhost:8080/`

## Warnings & Tips

- Split routes into their own resource-based file names, as demonstrated with `users.js` and `widgets.js`
- Split database schema (table definitions) and seeds (inserts) into separate files, one per table. See `db` folder for pre-populated examples. 

## Dependencies

- Node 10.x or above
- NPM 5.x or above
- PG 6.x

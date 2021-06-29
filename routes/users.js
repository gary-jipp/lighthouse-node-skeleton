/*
 * All routes for Users are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router = express.Router();

const testUser = { name: "bob" };

module.exports = (pool) => {

  router.post("/", (req, res) => {
    const name = req.body.name;
    console.log(req.body);

    pool.query(`SELECT * FROM users where name=$1`, [name])
      .then(data => {
        const user = data.rows[0];
        res.json(user);
      })
      .catch(err => {
        console.log(err);
        res
          .status(500)
          .json({ error: err.message });
      });
  });

  router.get("/", (req, res) => {
    pool.query(`SELECT * FROM users`)
      .then(data => {
        const users = data.rows;
        res.json({ users });
      })
      .catch(err => {
        res
          .status(500)
          .json({ error: err.message });
      });
  });

  return router;
};

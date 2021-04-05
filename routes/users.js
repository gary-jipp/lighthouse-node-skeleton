/*
 * All routes for Users are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router = express.Router();

const stubData = {
  users: [{ name: "bob" }, { name: "alice" }, { name: "Mallory" }]
};

module.exports = (pool) => {

  router.post("/", (req, res) => {
    console.log("I was Posted");
    res.json(stubData);
  });

  router.get("/", (req, res) => {
    pool.query(`SELECT * FROM users;`)
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


  // Notice there is no POST route defined here

  return router;
};

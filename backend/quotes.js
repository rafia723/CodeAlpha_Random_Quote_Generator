const express = require("express");

const { pool } = require("./database");

const quotesRouter = express.Router();


// GET endpoint
quotesRouter.get("/getQuotes", (req, res) => {   //Datacell
  const getQuery = "SELECT * FROM quotes";
  pool.query(getQuery, (err, result) => {
    if (err) {
      console.error("Error retrieving quotes:", err);
      res.status(500).send("Get Request Error");
      return;
    }
    res.json(result);
  });
});

module.exports = quotesRouter;

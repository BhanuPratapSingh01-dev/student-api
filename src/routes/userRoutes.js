const logger = require("../utils/logger");
const express = require("express");
const User = require("../models/user");

const router = express.Router();

// GET all users
router.get("/", async (req, res) => {
  logger.info("Fetching all users");
  const users = await User.find({});
  res.json(users);
});

// GET user by id
router.get("/:id", async (req, res) => {
  const user = await User.findById(req.params.id);

  if (!user) {
    logger.error("User not found");
    return res.status(404).json({ error: "User not found" });
  }

  res.json(user);
});

// CREATE user
router.post("/", async (req, res) => {
  const body = req.body;

  const user = await User.create({
    firstName: body.first_name,
    lastName: body.last_name,
    email: body.email,
    gender: body.gender,
    jobTitle: body.job_title,
  });

  res.status(201).json(user);
});

// UPDATE user
router.patch("/:id", async (req, res) => {
  const updatedUser = await User.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );

  res.json(updatedUser);
});

// DELETE user
router.delete("/:id", async (req, res) => {
  await User.findByIdAndDelete(req.params.id);
  res.json({ status: "Delete Success" });
});

module.exports = router;
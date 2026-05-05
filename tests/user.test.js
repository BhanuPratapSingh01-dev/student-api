jest.setTimeout(20000); // ⬅️ prevents timeout issues

const request = require("supertest");
const mongoose = require("mongoose");
const app = require("../src/app");

beforeAll(async () => {
  try {
    await mongoose.connect("mongodb://127.0.0.1:27017/test-db");
  } catch (err) {
    console.error("Test DB connection failed:", err);
    throw err;
  }
});

afterAll(async () => {
  await mongoose.connection.dropDatabase(); // ⬅️ cleanup
  await mongoose.connection.close();
});

describe("User API", () => {
  it("should get all users", async () => {
    const res = await request(app).get("/api/v1/users");
    expect(res.statusCode).toBe(200);
  });
});
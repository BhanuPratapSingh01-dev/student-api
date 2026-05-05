const request = require("supertest");
const mongoose = require("mongoose");
const app = require("../src/app");

describe("User API", () => {

  afterAll(async () => {
    await mongoose.connection.close();   // ✅ CLOSE DB
  });

  it("should get all users", async () => {
    const res = await request(app).get("/api/v1/users");
    expect(res.statusCode).toBe(200);
  });

});
const request = require("supertest");
const mongoose = require("mongoose");
const app = require("../src/app");

describe("User API", () => {

  afterAll(async () => {
    await mongoose.connection.close();   // ✅ CLOSE DB
  });

  it("should get all users", async () => {
    const res = await request(app).get("/api/v1/users");
    expect(res.statusCode).toBe(200);
  });

});
import js from "@eslint/js";
import globals from "globals";
import { defineConfig } from "eslint/config";

export default defineConfig([
  {
    files: ["**/*.js"],
    ...js.configs.recommended,
    languageOptions: {
      sourceType: "commonjs",
      globals: {
        ...globals.node,   // ✅ enables process, require
        ...globals.jest    // ✅ enables describe, it, expect
      }
    }
  }
]);
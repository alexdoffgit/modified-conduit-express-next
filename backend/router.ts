import express from "express";
import { register } from "./user/register";
const cors = require('cors')

const app = express()

app.use(express.json())
app.use(cors())

app.post("/api/users", register)

export {app}
let dotenv = require('dotenv')
let myEnv = dotenv.config()
let dotenvExpand = require('dotenv-expand')
dotenvExpand.expand(myEnv)

import { app } from "./router"

const port = 8080

app.listen(port, () => {
    console.log(`listening on http://localhost:${port}`)
})
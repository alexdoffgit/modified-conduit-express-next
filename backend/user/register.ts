import * as argon2 from "argon2";
import { pool } from "../database";
import { createSqlTag } from "slonik";
import { ZodError, z } from "zod";
import { RegisterBody } from "../common";
import { Request, Response, NextFunction } from "express";
import { v4 } from "uuid";

const sql = createSqlTag({
    typeAliases: {
        void: z.object({}).strict()
    }
})

async function registerUser(args: z.infer<typeof RegisterBody>) {
    const passwordHash = await argon2.hash(args.user.password)
    const db = await pool()

    db.any(sql.typeAlias('void')`
        INSERT INTO conduit_users (id, username, email, password_hash) 
        VALUES (${v4()}, ${args.user.username}, ${args.user.email}, ${passwordHash})`)
}

export const register = (req: Request<{}, {}, z.infer<typeof RegisterBody>>, res: Response, next: NextFunction) => {
    RegisterBody.parse(req.body)
    registerUser(req.body)
    .then(() => {
        res.send("ok")
    })
    .catch(next)
}
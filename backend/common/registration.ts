import { z } from "zod";

export const RegisterBody = z.object({
    user: z.object({
        username: z.string(),
        email: z.string().email(),
        password: z.string()
    })
})
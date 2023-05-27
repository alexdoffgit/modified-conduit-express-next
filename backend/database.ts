import { createPool } from "slonik"

export const pool = async () => {
    const db = await createPool(process.env.DB_CONN_STRING ?? "")
    return db
}
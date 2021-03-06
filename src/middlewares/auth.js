import connection from '../database.js';

export default async function auth(req, res, next) {
    const token = req.headers.authorization?.split('Bearer ')[1];
    const result = await connection.query('SELECT * FROM sessions WHERE token = $1', [token]);
    if (!result.rows.length) return res.sendStatus(401);
    return next();
}

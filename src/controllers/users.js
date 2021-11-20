import bcrypy from 'bcrypt';
import { v4 as uuid } from 'uuid';
import connection from '../database.js';

async function register(req, res) {
    const { name, email, password } = req.body;
    const hashedPassword = bcrypy.hashSync(password, 10);
    try {
        await connection.query(`
        INSERT INTO users
            (name, email, password)
        VALUES
            ($1, $2, $3)
        `, [name, email, hashedPassword]);
        return res.sendStatus(201);
    } catch (error) {
        console.log(error); // eslint-disable-line no-console
        return res.sendStatus(500);
    }
}

async function login(req, res) {
    const { id, name } = req.locals;
    try {
        const activeSession = await connection.query('SELECT * FROM sessions WHERE user_id = $1', [id]);
        if (!activeSession.rows.length) {
            const token = uuid();
            await connection.query('INSERT INTO sessions (user_id, token) VALUES ($1, $2)', [id, token]);
            return res.status(201).send({ id, name, token });
        }
        return res.status(201).send({ id, name, token: activeSession.rows[0].token });
    } catch (error) {
        console.log(error); // eslint-disable-line no-console
        return res.sendStatus(500);
    }
}

export {
    register,
    login,
};

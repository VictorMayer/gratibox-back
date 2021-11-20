import bcrypt from 'bcrypt';
import connection from '../database.js';

async function checkUser(req, res, next) {
    try {
        const { email, password } = req.body;
        const result = await connection.query('SELECT * FROM users WHERE email = $1', [email]);
        const user = result.rows[0];
        if (user && bcrypt.compareSync(password, user.password)) {
            req.locals = user;
            return next();
        }
        return res.status(404).send('Usuário e/ou senha incorreto(s)!');
    } catch (error) {
        console.log(error); // eslint-disable-line no-console
        return res.sendStatus(500);
    }
}

export default checkUser;

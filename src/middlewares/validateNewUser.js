import connection from '../database.js';
import validateUser from '../schemas/users.js';

function specifyError(error) {
    switch (error) {
    case 'name':
        return 'O nome inserido é muito curto, ou muito comprido';
    case 'email':
        return 'Formato de email inválido';
    case 'password':
        return 'Senha deve ter no mínimo 4 carácteres';
    default:
        return 'Nenhum erro encontrado';
    }
}

function validateNewUser(req, res, next) {
    const invalidBody = validateUser(req.body);
    if (invalidBody) return res.status(400).send(specifyError(invalidBody));
    return next();
}

async function checkUsedEmail(req, res, next) {
    const { email } = req.body;
    try {
        const existentEmail = await connection.query('SELECT * FROM users WHERE email = $1', [email]);
        if (existentEmail.rows.length) return res.status(409).send('Este email já está sendo utilizado!');
        return next();
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
}

export {
    validateNewUser,
    checkUsedEmail,
};

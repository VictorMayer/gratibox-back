/* eslint-disable object-curly-newline */
/* eslint-disable camelcase */
import dayjs from 'dayjs';
import connection from '../database.js';

async function getStates(req, res) {
    try {
        const result = await connection.query('SELECT * FROM states');
        if (!result.rows.length) return res.status(204).send('A lista de Estados não foi encontrada');
        return res.status(200).send(result.rows);
    } catch (error) {
        console.log(error); // eslint-disable-line no-console
        return res.sendStatus(500);
    }
}

async function getDeliveryDate(day) {
    const delivery_result = await connection.query('SELECT * FROM delivery_dates');
    const output = delivery_result.rows.find((date) => (day === date.name));
    return output;
}

async function postCategories(categories, plan_id) {
    try {
        if (categories.tea) await connection.query('INSERT INTO plan_categories (category_id, plan_id) VALUES ($1, $2)', [1, plan_id]);
        if (categories.organic) await connection.query('INSERT INTO plan_categories (category_id, plan_id) VALUES ($1, $2)', [2, plan_id]);
        if (categories.incense) await connection.query('INSERT INTO plan_categories (category_id, plan_id) VALUES ($1, $2)', [3, plan_id]);
        if (!categories.tea && !categories.organic && !categories.incense) return false;
        return true;
    } catch (error) {
        console.log(error); // eslint-disable-line no-console
        return false;
    }
}

async function newSubscription(req, res) {
    try {
        const { full_name, description, postal_code, city, state_id } = req.body.address;
        const addressResult = await connection.query('INSERT INTO addresses (full_name, description, postal_code, city, state_id) VALUES ($1, $2, $3, $4, $5) RETURNING ID', [full_name, description, postal_code, city, state_id]);
        const address_id = addressResult.rows[0];
        let plan_type_id;
        if (req.body.monthly) plan_type_id = 1;
        if (req.body.weekly) plan_type_id = 2;
        const delivery_date_id = await getDeliveryDate(req.body.delivery_date);
        const subscription_date = dayjs().format('DD/MM/YYYY');
        const planResult = await connection.query(`
            INSERT INTO plans
                (user_id, address_id, plan_type_id, delivery_date_id, subscription_date)
            VALUES
                ($1, $2, $3, $4, $5)
            RETURNING ID
        `, [req.body.user_id, address_id.id, plan_type_id, delivery_date_id.id, subscription_date]);
        const plan_id = planResult.rows[0].id;
        const { categories } = req.body;
        const result = await postCategories(categories, plan_id);
        if (result) {
            return res.sendStatus(201);
        }
        return res.sendStatus(400);
    } catch (error) {
        console.log(error); // eslint-disable-line no-console
        return res.sendStatus(500);
    }
}

export {
    getStates,
    newSubscription,
};

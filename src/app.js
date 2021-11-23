import cors from 'cors';
import express from 'express';
import auth from './middlewares/auth.js';
import checkUser from './middlewares/user.js';
import { register, login } from './controllers/users.js';
import { getStates, newSubscription } from './controllers/subscriptions.js';
import { validateNewUser, checkUsedEmail } from './middlewares/validateNewUser.js';

const app = express();
app.use(express.json());
app.use(cors());

app.get('/health', (req, res) => res.send('Bolezinha'));

// USERS
app.post('/sign-up', validateNewUser, checkUsedEmail, register);
app.post('/sign-in', checkUser, login);

// SUBSCRIPTION
app.get('/subscription/states', auth, getStates);
app.post('/subscription', auth, newSubscription);

export default app;

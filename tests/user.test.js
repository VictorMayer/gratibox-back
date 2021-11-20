/* eslint-disable no-undef */
import '../src/setup.js';
import supertest from 'supertest';
import app from '../src/app.js';
import connection from '../src/database.js';
import mockUserFactory from './factories/userFactory.js';

afterAll(async () => {
    await connection.query('DELETE FROM users');
    await connection.query('DELETE FROM sessions');
    connection.end();
});

describe('POST /sign-up', () => {
    afterEach(async () => {
        await connection.query('DELETE FROM users');
    });

    it('returns 201 for user registered succesfully', async () => {
        const mockUser = mockUserFactory();
        const result = await supertest(app)
            .post('/sign-up')
            .send(mockUser);
        expect(result.status).toEqual(201);
    });

    it('returns 409 for already used email', async () => {
        const mockUser = mockUserFactory('fixedEmail');
        const repeatedUser = mockUserFactory('fixedEmail');
        await supertest(app)
            .post('/sign-up')
            .send(repeatedUser);
        const result = await supertest(app)
            .post('/sign-up')
            .send(mockUser);
        expect(result.status).toEqual(409);
    });

    it('returns 400 for unsafe password', async () => {
        const mockUser = mockUserFactory('unsafePassword');
        const result = await supertest(app)
            .post('/sign-up')
            .send(mockUser);
        expect(result.status).toEqual(400);
    });
});

describe('POST /sign-in', () => {
    it('return 201 for user logged-in succesfully', async () => {
        const mockUser = mockUserFactory();
        await supertest(app).post('/sign-up').send(mockUser);
        const { email, password } = mockUser;
        const result = await supertest(app)
            .post('/sign-in')
            .send({ email, password });
        expect(result.status).toEqual(201);
    });

    it('return 404 for wrong password', async () => {
        const mockUser = mockUserFactory();
        await supertest(app).post('/sign-up').send(mockUser);
        const { email } = mockUser;
        const result = await supertest(app)
            .post('/sign-in')
            .send({ email, password: '1234' });
        expect(result.status).toEqual(404);
    });
});

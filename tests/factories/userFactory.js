import faker from 'faker';

faker.locale = 'pt_BR';

function mockUserFactory(restriction) {
    const mockUser = {
        name: faker.name.findName(),
        email: faker.internet.email(),
        password: faker.internet.password(4),
    };

    if (restriction === 'fixedEmail') {
        delete mockUser.email;
        const fixedEmailUser = {
            ...mockUser,
            email: 'joao.maluquinho@mail.com',
        };
        return fixedEmailUser;
    }

    if (restriction === 'unsafePassword') {
        delete mockUser.password;
        const unsafePasswordUser = {
            ...mockUser,
            password: '123',
        };
        return unsafePasswordUser;
    }

    return mockUser;
}

export default mockUserFactory;

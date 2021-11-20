import joi from 'joi';

function validateUser(user) {
    const userSchema = joi.object({
        name: joi.string().min(2).max(100).required(),
        email: joi.string().pattern(/^[^\s@]+@[^\s@]+\.[^\s@]+$/).required(),
        password: joi.string().min(4).required(),
    });
    if (userSchema.validate(user).error) return userSchema.validate(user).error.details[0].context.key; // eslint-disable-line max-len
    return false;
}

export default validateUser;

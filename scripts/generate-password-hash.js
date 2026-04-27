const bcrypt = require('bcryptjs');
const dotenv = require('dotenv');

dotenv.config({ path: '.env' });

const password = 'AdminPassword123!';
const hash = bcrypt.hashSync(password, 10);

console.log('Password:', password);
console.log('Hash:', hash);

import mysql from 'mysql2/promise';
async function run() {
    const c = await mysql.createConnection('mysql://root@localhost:3306/t_absensi');
    const [r] = await c.query('SELECT clock_in, status FROM attendance WHERE status = "late" LIMIT 5');
    console.log(JSON.stringify(r));
    await c.end();
}
run();

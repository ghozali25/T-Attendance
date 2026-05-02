
const h_date = "2025-12-31T17:00:00.000Z";
const normalized = new Date(h_date).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
console.log('Normalized:', normalized);

const cursor = new Date("2026-01-01");
const ds = cursor.toISOString().split('T')[0];
console.log('DS:', ds);

const ds_local = cursor.toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
console.log('DS Local:', ds_local);

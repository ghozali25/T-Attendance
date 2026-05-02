async function run() {
    const all = await fetch('http://localhost:3001/api/db/query', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            sql: "SELECT clock_in, date FROM attendance WHERE date >= ? AND date <= ?",
            params: ['2026-01-01', '2026-01-31']
        })
    });
    const allData = await all.json();
    console.log('Result date length:', allData.length);
    console.log('Sample date:', allData.slice(0, 2));
}
run().catch(console.error);

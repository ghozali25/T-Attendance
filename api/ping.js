export default function handler(request, response) {
  response.status(200).json({
    status: 'pong',
    time: new Date().toISOString(),
    message: 'Backend is reachable'
  });
}

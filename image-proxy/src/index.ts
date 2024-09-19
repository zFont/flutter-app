import { Hono } from 'hono';
const app = new Hono();

app.all('/*', async (c) => {
  try {
    // Extract the target URL using the request path and create a URL object
    const url = decodeURIComponent(c.req.path.substring(1));

    // Handle CORS preflight (OPTIONS) requests
    if (c.req.method === 'OPTIONS') {
      return c.text('OK', 204, {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      });
    }

    // Fetch the target URL, forwarding headers
    const proxyResponse = await fetch(url, {
      method: c.req.method,
      headers: c.req.header(), // Forward incoming request headers
    });

    // Create new headers for the response
    const responseHeaders = new Headers(proxyResponse.headers);
    responseHeaders.set('Access-Control-Allow-Origin', '*'); // Allow all origins
    responseHeaders.set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    responseHeaders.set('Access-Control-Allow-Headers', 'Content-Type, Authorization');

    // Return the new response with modified headers
    return new Response(proxyResponse.body, {
      headers: responseHeaders,
      status: proxyResponse.status,
    });

  } catch (error) {
    console.error(error);
    return c.text('Error fetching the URL', 500);
  }
});

export default app;

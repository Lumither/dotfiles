// tabby-agent 1.8.0 passes a dispatcher built from its bundled (old) undici into
// Node's global fetch; Node >= 26 rejects it with "invalid onError method", so every
// request fails and the LSP unregisters textDocument/inlineCompletion.
const orig = globalThis.fetch;
globalThis.fetch = (input, init) => {
  if (init && init.dispatcher) {
    const { dispatcher, ...rest } = init;
    init = rest;
  }
  return orig(input, init);
};

{{flutter_js}}
{{flutter_build_config}}

const loading = document.createElement('p');
loading.className = "bottom";
document.body.appendChild(loading);
loading.textContent = "Loading Entrypoint...";

// Customize the app initialization process
_flutter.loader.load({
    onEntrypointLoaded: async function(engineInitializer) {
        loading.textContent = "Initializing engine...";
        /**
        const appRunner = await engineInitializer.initializeEngine({
           useColorEmoji: true
        });
        **/
        const appRunner = await engineInitializer.initializeEngine();
        loading.textContent = "Running app...";
        await appRunner.runApp();
    },
    serviceWorkerSettings: {
        serviceWorkerVersion: {{flutter_service_worker_version}},
    },
});
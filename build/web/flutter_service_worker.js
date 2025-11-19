'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9ce2f39210702a5fcf86fb84807ffcfe",
"assets/AssetManifest.bin.json": "9ce3a4d3226cb4cb80267854e640fd93",
"assets/AssetManifest.json": "535a9b177f5bbd60f8754ca3de562cd2",
"assets/assets/icons/active.png": "78a0440bde18173d32b76f23e3616792",
"assets/assets/icons/active_user.png": "44b46b7aa2f7d537965cd171591ec7ea",
"assets/assets/icons/alert.png": "78c8f5a2d7292173dad7684859cda699",
"assets/assets/icons/blue-dot.png": "548656df141d88952680d0590867c30d",
"assets/assets/icons/bug.png": "d3da5e633784039a00bb5b064bf5beb8",
"assets/assets/icons/Dashboard.png": "9ea98f7225a813a40d38f799301ab79f",
"assets/assets/icons/disable.png": "0e28430135daf55a59eadf43b5fe8234",
"assets/assets/icons/document.png": "d2cb3bdf96620092b51820bb8273437a",
"assets/assets/icons/google.png": "e8a23a705a43a385a2fe8e052a49c1c7",
"assets/assets/icons/green-signal.png": "27ec88aa6c97cf79950319e006e225c0",
"assets/assets/icons/green_dot.png": "a99f758d76f1734fb4cb0e3975a32ec7",
"assets/assets/icons/grey_dot.png": "d4d9ab967536a780762356057f49555e",
"assets/assets/icons/Logout.png": "607a976cdb3778d83e9ea247eeea7cc2",
"assets/assets/icons/machine.png": "f070accd2199276d7be9bee8914710cf",
"assets/assets/icons/machines.png": "91964a1fdc55b9df4e7b2a002f72dc01",
"assets/assets/icons/no-signal.png": "92f05f0fc988f0ad2294c8b5f4951da1",
"assets/assets/icons/notification.png": "8ecb059854e344c1086ebfbe8ef6ec61",
"assets/assets/icons/orange_dot.png": "30542545616eca8bce9e471f53ec103d",
"assets/assets/icons/person.png": "b9dab1b47ed120214ae6fad4f2538f0e",
"assets/assets/icons/red_dot.png": "90e7b7dd75355dd4391b8a168c70d867",
"assets/assets/icons/search.png": "5bcb165c3c7eedc3b7bfe580e4975bdc",
"assets/assets/icons/setting.png": "d37ac84551d4bafff5da96b9cc0d572c",
"assets/assets/icons/share.png": "09210ae0271871755adfed8192bbfa69",
"assets/assets/icons/signal.png": "07ee3ad39919791d6321e2dcba1bd4ae",
"assets/assets/icons/users.png": "f04ec19e1dd468cafa23ca54c4d368c2",
"assets/assets/icons/user_new.png": "d23aca0885db0af5acb17dc1e4884a6d",
"assets/assets/icons/yellow_dot.png": "f636fb6561ae730940754046dcc7628e",
"assets/assets/images/banner.png": "77f984f98adbd795075c4887a6e24605",
"assets/assets/images/bg-image.png": "29015291ade11fac2754b68a46d6b670",
"assets/assets/images/logo.png": "2bb4131ae900af13ffb6580a672d292b",
"assets/assets/images/sidebar_logo.png": "9186d3bf5e237dc81e00f0766c4f1e8c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "b775b9b4bbf14a94824f2469da108112",
"assets/NOTICES": "9d14ce66064e33cd0c18f969e5e6474e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "36ced38e2c6458a822f7da6771477ce4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fd67133c07741f257725aa2f940f78dc",
"/": "fd67133c07741f257725aa2f940f78dc",
"main.dart.js": "febd23e0843b5d1a42322f341f1b3d81",
"manifest.json": "82ad6d776b6aadc16dff4c79b40e42c6",
"version.json": "423c4f99c5bdb43a950f94f546babc6d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

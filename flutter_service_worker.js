'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"manifest.json": "039411dc671a94d539854de9cf7084fd",
"main.dart.mjs": "4ee5a8ce39a5122993471d44060dd5db",
"main.dart.js": "0a32e670d70ace0b5d78b5dea21acf9d",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"index.html": "7e7b3429fa485587343e92faf0e2f868",
"/": "7e7b3429fa485587343e92faf0e2f868",
"assets/AssetManifest.bin.json": "6c85fec962e8f6ccecdbe725a854a9ef",
"assets/AssetManifest.bin": "a6dd272a649dfbddd524700b1fd83609",
"assets/NOTICES": "f6f70a622b30fdb801206f67c1195e74",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icon.png": "35fe01c334a2e737a1382857046d036c",
"assets/assets/data.json": "b75446da1bb47727b583b1cab8c6d491",
"assets/assets/images/6443ae6f-e0ef-4302-a891-8c60d013558c.png": "8230295ea6c98d44dd9dcd84456e214e",
"assets/assets/images/c464cb44-5725-46a3-8fb9-0f7a0cca79a3.png": "a5084944b143bb1ccd3e5142d64ce484",
"assets/assets/images/76f33678-dbdd-474d-b5e2-14a575403390.png": "ae16a686e9f43d46a14fd2f5a371cbe4",
"assets/assets/images/9f37a63f-4c12-4550-8723-0bf8c8893a60.png": "e10254903b5997fe510e8f298bbe8ab2",
"assets/assets/images/19627409-5da2-4c2c-827d-f58decd59ebc.png": "7efb0d87e758b0a61de4339d8c0811c7",
"assets/assets/images/8314e253-ad0c-44ac-a401-a2af5f25ad4a.png": "7a3204459e7611e76776a21e46c706a3",
"assets/assets/images/1ac11956-7863-468f-a598-8453b6a99d56.png": "035042cdf3d32e5703abc8e40a9f5964",
"assets/assets/images/25425c76-1e46-4efe-8642-eb9e0e5340f7.png": "0593be24384b286926a8c17832edbe94",
"assets/assets/images/feb63d5f-acc0-4a33-893e-5f635b28a19d.png": "a70d16c13cbefda8193fc8aa4d27022f",
"assets/assets/images/cd326adc-3169-4200-9b65-9a014d45ea21.png": "ffab802ef04a4e64dd3ad9c1e5f8e9ce",
"assets/assets/images/6f569761-7591-488d-b99f-3fa7ec3d0443.png": "476a6d1a7db77dec930b14040b49a7a4",
"assets/assets/images/5075824c-c6a3-44a7-8bb0-5e3edcc270fc.png": "0e030e45760372f7bdb974a205557f4c",
"assets/assets/images/62c312e3-3fab-48d7-8b48-81e5680b5442.png": "20436aef8db1e4bbf4bd33c939c39a5c",
"assets/assets/images/322d6e37-a925-4d91-b335-b8e5b510ad09.png": "48e9df94cff0bafdb25ec3504995a975",
"assets/assets/images/1e3a93d7-34df-414f-8c51-00ff32b227d3.png": "62c4c909a0b85bfc5df7c73cc54ba37f",
"assets/assets/images/c4ebe90c-dc08-4754-b3d1-a28dc6ba26e3.png": "95050d699d66416d9a6bed972bfa006f",
"assets/assets/images/ebb4b5ee-4800-40d1-9d81-8379a5deb3fd.png": "fe83104924d3680230a1ced106252ced",
"assets/assets/images/5dcf0944-1be8-4f91-a452-79cdee045fcf.png": "4de42b5a6ef4c5f08c6847736a1dce4b",
"assets/assets/images/387d4c48-9ee5-4ae7-8723-30c938ee3a1c.png": "b793aae2d052e641420fa80526f284c2",
"assets/assets/images/84376182-4746-4457-9e30-92dfff9a35aa.png": "d33aba31b695479aace9736d17b62db3",
"assets/assets/images/5cbcbdec-4466-4aea-8cf3-02bc69c6da23.png": "acd7801a0e5ffdcefa0e838367028087",
"assets/assets/images/ed123e82-1274-46f1-b0a6-c6e34a95c255.png": "f16b01d45a306325f22ac52ad5419b50",
"assets/AssetManifest.json": "0306e3f7db85bcb06c74eab52136faf9",
"assets/fonts/MaterialIcons-Regular.otf": "853606a17f238765fb61a85d29580bb9",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"favicon.png": "64380bcc38d1b7e35e004c4c1c3dcbeb",
"icons/Icon-512.png": "6548f466d4c69b2bbfcac1b311f4fa54",
"icons/Icon-maskable-192.png": "09d4d8ac1a77f1b9b4b57bc36d3c5649",
"icons/Icon-192.png": "09d4d8ac1a77f1b9b4b57bc36d3c5649",
"icons/Icon-maskable-512.png": "6548f466d4c69b2bbfcac1b311f4fa54",
"flutter_bootstrap.js": "bb64956ae7f66b8cf27bca50a3d6373a",
"main.dart.wasm": "6305377eb9e5fb993dd0b38780833fe9",
"version.json": "11e1a177d57c5da2bc6e3a6acc3010f4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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

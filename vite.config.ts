import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import path from "path";
import { componentTagger } from "lovable-tagger";
import { VitePWA } from "vite-plugin-pwa";
import viteCompression from "vite-plugin-compression";

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  server: {
    host: "0.0.0.0",
    port: 8080,
    proxy: {
      "/api": {
        target: "http://localhost:3001",
        changeOrigin: true,
        secure: false,
      },
    },
  },

  plugins: [
    react(),
    mode === "development" && componentTagger(),

    // PWA Plugin
    VitePWA({
      registerType: "autoUpdate",
      includeAssets: ["favicon.ico", "favicon.png", "robots.txt"],

      manifest: {
        name: "T-Absensi - Sistem Absensi Karyawan",
        short_name: "T-Absensi",
        description: "Sistem Absensi & Manajemen Karyawan by T-Attendance",
        theme_color: "#0066b3",
        background_color: "#ffffff",
        display: "standalone",
        orientation: "portrait",
        scope: "/",
        start_url: "/",
        categories: ["business", "productivity"],

        icons: [
          {
            src: "/favicon.png",
            sizes: "192x192",
            type: "image/png",
            purpose: "any",
          },
          {
            src: "/favicon.png",
            sizes: "512x512",
            type: "image/png",
            purpose: "any",
          },
          {
            src: "/favicon.png",
            sizes: "192x192",
            type: "image/png",
            purpose: "maskable",
          },
          {
            src: "/favicon.png",
            sizes: "512x512",
            type: "image/png",
            purpose: "maskable",
          },
        ],

        shortcuts: [
          {
            name: "Clock In",
            short_name: "Clock In",
            description: "Record your attendance",
            url: "/karyawan/absensi",
            icons: [{ src: "/favicon.png", sizes: "192x192" }],
          },
          {
            name: "History",
            short_name: "Riwayat",
            description: "View attendance history",
            url: "/karyawan/riwayat",
            icons: [{ src: "/favicon.png", sizes: "192x192" }],
          },
        ],
      },

      workbox: {
        globPatterns: ["**/*.{js,css,html,ico,png,svg,woff,woff2}"],

        runtimeCaching: [
          {
            urlPattern: /\.(?:png|jpg|jpeg|svg|gif|webp|ico)$/i,
            handler: "CacheFirst",
            options: {
              cacheName: "images-cache",
              expiration: {
                maxEntries: 60,
                maxAgeSeconds: 60 * 60 * 24 * 30,
              },
            },
          },

          {
            urlPattern: /\.(?:woff|woff2|ttf|eot)$/i,
            handler: "CacheFirst",
            options: {
              cacheName: "fonts-cache",
              expiration: {
                maxEntries: 20,
                maxAgeSeconds: 60 * 60 * 24 * 365,
              },
            },
          },

          {
            urlPattern: /^https:\/\/fonts\.googleapis\.com\/.*/i,
            handler: "CacheFirst",
            options: {
              cacheName: "google-fonts-cache",
              expiration: {
                maxEntries: 10,
                maxAgeSeconds: 60 * 60 * 24 * 365,
              },
            },
          },
        ],

        skipWaiting: true,
        clientsClaim: true,
      },

      devOptions: {
        enabled: false,
      },
    }),

    // Gzip compression
    mode === "production" &&
      viteCompression({
        algorithm: "gzip",
        ext: ".gz",
        threshold: 1024,
      }),

    // Brotli compression
    mode === "production" &&
      viteCompression({
        algorithm: "brotliCompress",
        ext: ".br",
        threshold: 1024,
      }),
  ].filter(Boolean),

  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },

  build: {
    target: "esnext",

    minify: "terser",

    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true,
        pure_funcs: [
          "console.log",
          "console.info",
          "console.debug",
        ],
      },
      mangle: true,
    },

    sourcemap: false,

    chunkSizeWarningLimit: 500,

    rollupOptions: {
      output: {
        manualChunks: {
          "vendor-react": ["react", "react-dom"],
          "vendor-router": ["react-router-dom"],
          "vendor-query": ["@tanstack/react-query"],

          "vendor-ui": [
            "@radix-ui/react-dialog",
            "@radix-ui/react-dropdown-menu",
            "@radix-ui/react-select",
            "@radix-ui/react-tabs",
            "@radix-ui/react-toast",
            "@radix-ui/react-tooltip",
            "@radix-ui/react-popover",
          ],

          "vendor-form": [
            "react-hook-form",
            "@hookform/resolvers",
            "zod",
          ],

          "vendor-charts": ["recharts"],

          "vendor-icons": ["lucide-react"],

          "vendor-utils": [
            "date-fns",
            "clsx",
            "tailwind-merge",
            "class-variance-authority",
          ],
        },

        chunkFileNames: (chunkInfo) => {
          const facadeModuleId = chunkInfo.facadeModuleId || "";

          if (facadeModuleId.includes("node_modules")) {
            return "assets/vendor/[name]-[hash].js";
          }

          return "assets/chunks/[name]-[hash].js";
        },

        entryFileNames: "assets/[name]-[hash].js",

        assetFileNames: (assetInfo) => {
          const info = assetInfo.name?.split(".") || [];
          const ext = info[info.length - 1];

          if (/png|jpe?g|svg|gif|tiff|bmp|ico/i.test(ext)) {
            return "assets/images/[name]-[hash][extname]";
          }

          if (/woff2?|ttf|eot/i.test(ext)) {
            return "assets/fonts/[name]-[hash][extname]";
          }

          if (/css/i.test(ext)) {
            return "assets/css/[name]-[hash][extname]";
          }

          return "assets/[name]-[hash][extname]";
        },
      },
    },

    cssCodeSplit: true,

    assetsInlineLimit: 4096,
  },

  preview: {
    port: 8080,
    host: "0.0.0.0",
  },

  optimizeDeps: {
    include: [
      "react",
      "react-dom",
      "react-router-dom",
      "@tanstack/react-query",
      "lucide-react",
      "zod",
      "react-hook-form",
    ],

    exclude: ["mysql2"],
  },
}));
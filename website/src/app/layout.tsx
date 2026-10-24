import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import Script from "next/script";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  metadataBase: new URL("https://getvela.app"),
  title: "VELA — Catch every thought. Push every action.",
  description:
    "Share from any app — links, voice notes, screenshots — and VELA routes them to Calendar, Gmail, Notion, and more.",
  keywords: [
    "productivity",
    "task automation",
    "calendar",
    "Gmail",
    "Notion",
    "Kenya",
    "East Africa",
  ],
  openGraph: {
    title: "VELA — Catch every thought. Push every action.",
    description:
      "Share from any app. VELA routes your thoughts to the right tools, automatically.",
    type: "website",
    url: "https://getvela.app",
  },
  twitter: {
    card: "summary_large_image",
    title: "VELA — Catch every thought. Push every action.",
    description:
      "Share from any app. VELA routes your thoughts to the right tools, automatically.",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
      <body className="min-h-screen">
        {children}
        <Script
          defer
          data-domain="getvela.app"
          src="https://plausible.io/js/script.js"
          strategy="afterInteractive"
        />
      </body>
    </html>
  );
}

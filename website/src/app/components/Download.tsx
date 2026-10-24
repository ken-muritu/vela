"use client";

import { motion } from "framer-motion";
import { Download, Smartphone } from "lucide-react";

export default function DownloadSection() {
  return (
    <section id="download" className="px-6 py-24 md:py-32">
      <div className="mx-auto max-w-3xl text-center">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.6 }}
        >
          <h2 className="text-3xl font-semibold tracking-tight sm:text-4xl">
            Try the app today
          </h2>
          <p className="mx-auto mt-4 max-w-lg text-base text-muted">
            VELA isn&apos;t on the Play Store or App Store yet — but you can
            download the Android APK directly and start using it now.
          </p>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 12 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-80px" }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="mt-10 flex flex-col items-center gap-4 sm:flex-row sm:justify-center"
        >
          <a
            href="https://github.com/ken-muritu/vela/releases/latest/download/app-release.apk"
            className="group flex items-center gap-3 rounded-full bg-foreground px-8 py-3.5 text-base font-medium text-background transition-colors hover:bg-accent-hover"
          >
            <Download size={18} />
            Download APK
          </a>
          <div className="flex items-center gap-2 text-sm text-muted">
            <Smartphone size={14} />
            <span>Android only · iOS coming soon</span>
          </div>
        </motion.div>

        <motion.p
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.6, delay: 0.2 }}
          className="mt-6 text-xs text-muted/50"
        >
          You may need to enable &ldquo;Install from unknown sources&rdquo; in
          your Android settings.
        </motion.p>
      </div>
    </section>
  );
}

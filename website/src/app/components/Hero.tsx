"use client";

import { motion } from "framer-motion";
import { ArrowRight } from "lucide-react";

const stats = [
  { value: "3×", label: "faster than typing" },
  { value: "5 sec", label: "share to action" },
  { value: "0", label: "manual copy-paste" },
];

export default function Hero() {
  return (
    <section className="relative flex min-h-[90vh] items-center justify-center px-6 pt-32 pb-16">
      <div className="mx-auto max-w-3xl text-center">
        <motion.p
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.8 }}
          className="text-xs font-semibold uppercase tracking-widest text-muted"
        >
          Now accepting early access · Android beta
        </motion.p>

        <motion.h1
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.1 }}
          className="mt-6 text-5xl font-semibold leading-[1.08] tracking-tight sm:text-6xl md:text-7xl"
        >
          Catch every thought.
          <br />
          Push{" "}
          <span className="relative inline-block whitespace-nowrap">
            every action.
            <svg
              aria-hidden="true"
              viewBox="0 0 300 10"
              preserveAspectRatio="none"
              className="pointer-events-none absolute -bottom-1 left-0 w-full overflow-visible"
              style={{ height: "0.25em" }}
            >
              <motion.path
                d="M2,6 C50,1 100,9 150,5 C200,1 250,9 298,5"
                fill="none"
                stroke="currentColor"
                strokeWidth="6"
                strokeLinecap="round"
                initial={{ pathLength: 0, opacity: 0 }}
                animate={{ pathLength: 1, opacity: 1 }}
                transition={{ duration: 0.9, delay: 0.7, ease: "easeOut" }}
              />
            </svg>
          </span>
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="mx-auto mt-6 max-w-xl text-lg leading-relaxed text-muted"
        >
          Share a link, voice note, or screenshot from any app.
          VELA turns it into a calendar event, email draft, or note — automatically.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="mt-10 flex flex-col items-center gap-4 sm:flex-row sm:justify-center"
        >
          <a
            href="#waitlist"
            className="group flex items-center gap-2 rounded-full bg-foreground px-8 py-3.5 text-base font-medium text-background transition-colors hover:bg-accent-hover"
          >
            Get Early Access
            <ArrowRight size={16} className="transition-transform group-hover:translate-x-0.5" />
          </a>
          <a
            href="#how-it-works"
            className="text-sm font-medium text-muted underline-offset-4 hover:underline hover:text-foreground transition-colors"
          >
            See how it works
          </a>
        </motion.div>

        {/* Social proof numbers */}
        <motion.div
          initial={{ opacity: 0, y: 8 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.7, delay: 0.45 }}
          className="mt-12 flex items-center justify-center gap-10 border-t border-border pt-10"
        >
          {stats.map((s) => (
            <div key={s.label} className="text-center">
              <p className="text-2xl font-semibold tracking-tight">{s.value}</p>
              <p className="mt-0.5 text-xs text-muted">{s.label}</p>
            </div>
          ))}
        </motion.div>

        {/* Product preview */}
        <motion.div
          initial={{ opacity: 0, y: 24 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 1, delay: 0.55 }}
          className="mx-auto mt-16 max-w-sm"
        >
          <div className="rounded-[2.5rem] border border-border bg-surface p-4 shadow-xl shadow-black/5">
            <div className="rounded-[2rem] bg-surface-alt p-5">
              <div className="space-y-3">
                <div className="flex justify-end">
                  <div className="max-w-[80%] rounded-2xl rounded-tr-md bg-foreground px-4 py-2.5 text-sm text-background">
                    Meeting with Sarah tomorrow at 2pm at Java House
                  </div>
                </div>
                <div className="flex justify-start">
                  <div className="max-w-[80%] rounded-2xl rounded-tl-md border border-border bg-surface px-4 py-2.5 text-sm">
                    <span className="font-medium text-success">✓ Event created</span>
                    <p className="mt-1 text-xs text-muted">
                      &quot;Meeting with Sarah&quot; added to Google Calendar
                      <br />
                      Tomorrow, 2:00 PM · Java House Westlands
                    </p>
                  </div>
                </div>
                <div className="flex justify-end">
                  <div className="max-w-[80%] rounded-2xl rounded-tr-md bg-foreground px-4 py-2.5 text-sm text-background">
                    Draft email to Kamau about the invoice
                  </div>
                </div>
                <div className="flex justify-start">
                  <div className="max-w-[80%] rounded-2xl rounded-tl-md border border-border bg-surface px-4 py-2.5 text-sm">
                    <span className="font-medium text-success">✓ Draft ready</span>
                    <p className="mt-1 text-xs text-muted">
                      Gmail draft created with subject &amp; body
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}

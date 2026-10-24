"use client";

import { motion } from "framer-motion";

export default function Problem() {
  return (
    <section className="px-6 py-24 md:py-32">
      <div className="mx-auto max-w-3xl text-center">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.6 }}
        >
          <h2 className="text-3xl font-semibold tracking-tight sm:text-4xl">
            You save everything.
            <br />
            <span className="text-muted">You act on almost nothing.</span>
          </h2>
          <p className="mx-auto mt-6 max-w-xl text-base leading-relaxed text-muted">
            Links saved to &ldquo;read later.&rdquo; Voice notes you&apos;ll never replay.
            Screenshots lost in your camera roll. The gap between capturing
            an idea and acting on it is where most intentions go to die.
          </p>
        </motion.div>

        <div className="mt-16 grid gap-px overflow-hidden rounded-2xl border border-border bg-border md:grid-cols-3">
          {[
            {
              title: "Capture",
              desc: "Links, voice notes, screenshots — saved everywhere, organised nowhere.",
            },
            {
              title: "Forget",
              desc: "No calendar event. No email draft. No task created. Just raw text sitting there.",
            },
            {
              title: "Repeat",
              desc: "Missed meetings, lost ideas, forgotten follow-ups. Every single week.",
            },
          ].map((item, i) => (
            <motion.div
              key={item.title}
              initial={{ opacity: 0, y: 12 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-80px" }}
              transition={{ duration: 0.5, delay: i * 0.1 }}
              className="bg-surface p-8"
            >
              <p className="text-sm font-semibold uppercase tracking-widest text-muted/50">
                {String(i + 1).padStart(2, "0")}
              </p>
              <h3 className="mt-3 text-lg font-semibold">{item.title}</h3>
              <p className="mt-2 text-sm leading-relaxed text-muted">{item.desc}</p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}

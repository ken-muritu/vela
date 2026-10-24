"use client";

import { motion } from "framer-motion";

const steps = [
  {
    num: "01",
    title: "Share",
    desc: "See a link, record a voice note, or take a screenshot. Hit share → VELA.",
  },
  {
    num: "02",
    title: "Understand",
    desc: "VELA detects what needs to happen — create an event, draft an email, save a note — and extracts every detail.",
  },
  {
    num: "03",
    title: "Route",
    desc: "The right action fires in the right app. Google Calendar, Gmail, Notion, Reminders. No manual entry.",
  },
];

export default function HowItWorks() {
  return (
    <section id="how-it-works" className="px-6 py-24 md:py-32">
      <div className="mx-auto max-w-5xl">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.6 }}
          className="text-center"
        >
          <h2 className="text-3xl font-semibold tracking-tight sm:text-4xl">
            Three steps. Zero friction.
          </h2>
        </motion.div>

        <div className="mt-16 grid gap-12 md:grid-cols-3">
          {steps.map((step, i) => (
            <motion.div
              key={step.num}
              initial={{ opacity: 0, y: 12 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-80px" }}
              transition={{ duration: 0.5, delay: i * 0.15 }}
            >
              <p className="text-5xl font-semibold text-border">{step.num}</p>
              <h3 className="mt-4 text-xl font-semibold">{step.title}</h3>
              <p className="mt-2 text-sm leading-relaxed text-muted">{step.desc}</p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}

"use client";

import { motion } from "framer-motion";
import { Share2, Mic, Image, Calendar, Mail, FileText, ArrowUpRight } from "lucide-react";

const features = [
  {
    icon: Share2,
    title: "Share from any app",
    desc: "See something in WhatsApp, Twitter, or Safari? Share it directly to VELA using the native share sheet.",
  },
  {
    icon: Mic,
    title: "Voice notes",
    desc: "Record a thought. VELA transcribes it, understands the intent, and routes the action. Works with African English and Swahili.",
  },
  {
    icon: Image,
    title: "Screenshots & images",
    desc: "Share an event flyer or M-Pesa receipt. VELA extracts dates, amounts, and details automatically.",
  },
  {
    icon: Calendar,
    title: "Google Calendar",
    desc: "'Meeting with Sarah tomorrow 2pm' becomes a calendar event with the right time, place, and reminders.",
  },
  {
    icon: Mail,
    title: "Gmail drafts",
    desc: "'Email Kamau about the invoice' becomes a ready-to-send draft with subject, body, and recipient.",
  },
  {
    icon: FileText,
    title: "Notion & notes",
    desc: "Save ideas, links, and notes to your Notion workspace. Organised by topic, searchable later.",
  },
];

export default function Features() {
  return (
    <section id="features" className="px-6 py-24 md:py-32 bg-surface-alt">
      <div className="mx-auto max-w-5xl">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.6 }}
          className="text-center"
        >
          <h2 className="text-3xl font-semibold tracking-tight sm:text-4xl">
            One inbox for everything you want to do
          </h2>
          <p className="mx-auto mt-4 max-w-xl text-base text-muted">
            Share anything to VELA — text, voice, or image — and it routes the right action to the right app.
          </p>
        </motion.div>

        <div className="mt-16 grid gap-10 sm:grid-cols-2 lg:grid-cols-3">
          {features.map((feature, i) => (
            <motion.div
              key={feature.title}
              initial={{ opacity: 0, y: 12 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-80px" }}
              transition={{ duration: 0.4, delay: i * 0.05 }}
            >
              <div className="group/card relative rounded-2xl border border-border bg-surface p-6 transition-shadow hover:shadow-md hover:shadow-black/5">
              <div className="flex items-start justify-between">
                <div className="flex h-10 w-10 items-center justify-center rounded-xl border border-border bg-surface-alt text-foreground">
                  <feature.icon size={20} strokeWidth={1.5} />
                </div>
                <ArrowUpRight
                  size={16}
                  className="text-muted/30 transition-all duration-300 group-hover/card:translate-x-1 group-hover/card:-translate-y-1 group-hover/card:text-foreground"
                />
              </div>
              <h3 className="mt-4 text-base font-semibold">{feature.title}</h3>
              <p className="mt-2 text-sm leading-relaxed text-muted">{feature.desc}</p>
            </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}

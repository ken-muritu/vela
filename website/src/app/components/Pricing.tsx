"use client";

import { motion } from "framer-motion";
import { Check } from "lucide-react";

const plans = [
  {
    name: "Starter",
    price: "Free",
    period: "",
    desc: "For getting started.",
    features: [
      "50 actions per month",
      "Google Calendar sync",
      "Text input",
      "7-day history",
    ],
    cta: "Join Waitlist",
    featured: false,
  },
  {
    name: "Pro",
    price: "KES 599",
    period: "/mo",
    desc: "For people who mean business.",
    features: [
      "Unlimited actions",
      "All integrations",
      "Voice note intelligence",
      "Image & screenshot processing",
      "Unlimited history & search",
      "Morning briefing digest",
      "Priority support",
    ],
    cta: "Join Waitlist",
    featured: true,
  },
];

export default function Pricing() {
  return (
    <section id="pricing" className="px-6 py-24 md:py-32 bg-surface-alt">
      <div className="mx-auto max-w-3xl">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 0.6 }}
          className="text-center"
        >
          <h2 className="text-3xl font-semibold tracking-tight sm:text-4xl">
            Simple, honest pricing
          </h2>
          <p className="mx-auto mt-4 max-w-lg text-base text-muted">
            M-Pesa accepted. No hidden fees. Cancel anytime.
          </p>
        </motion.div>

        <div className="mt-16 grid gap-6 md:grid-cols-2">
          {plans.map((plan, i) => (
            <motion.div
              key={plan.name}
              initial={{ opacity: 0, y: 12 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-80px" }}
              transition={{ duration: 0.5, delay: i * 0.1 }}
              className={`rounded-2xl border p-8 ${
                plan.featured
                  ? "border-foreground bg-foreground text-background"
                  : "border-border bg-surface"
              }`}
            >
              <h3 className={`text-sm font-semibold uppercase tracking-widest ${plan.featured ? "text-background/60" : "text-muted"}`}>
                {plan.name}
              </h3>
              <div className="mt-4 flex items-baseline gap-1">
                <span className="text-4xl font-semibold">{plan.price}</span>
                {plan.period && (
                  <span className={`text-sm ${plan.featured ? "text-background/50" : "text-muted"}`}>{plan.period}</span>
                )}
              </div>
              <p className={`mt-2 text-sm ${plan.featured ? "text-background/60" : "text-muted"}`}>{plan.desc}</p>

              <a
                href="#waitlist"
                className={`mt-6 block w-full rounded-full py-3 text-center text-sm font-medium transition-colors ${
                  plan.featured
                    ? "bg-background text-foreground hover:bg-background/90"
                    : "bg-foreground text-background hover:bg-accent-hover"
                }`}
              >
                {plan.cta}
              </a>

              <ul className="mt-8 space-y-3">
                {plan.features.map((feature) => (
                  <li
                    key={feature}
                    className={`flex items-start gap-3 text-sm ${plan.featured ? "text-background/80" : "text-muted"}`}
                  >
                    <Check
                      size={16}
                      className={`mt-0.5 shrink-0 ${plan.featured ? "text-background/40" : "text-foreground/30"}`}
                    />
                    {feature}
                  </li>
                ))}
              </ul>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}

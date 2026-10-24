"use client";

import { useState } from "react";
import { X, ArrowRight } from "lucide-react";

export default function Banner() {
  const [visible, setVisible] = useState(true);

  if (!visible) return null;

  return (
    <div className="relative z-50 bg-foreground text-background">
      <div className="mx-auto flex max-w-5xl items-center justify-center gap-3 px-10 py-2.5">
        <span className="hidden text-xs font-semibold uppercase tracking-widest text-background/40 md:inline">
          New
        </span>
        <a
          href="#download"
          className="flex items-center gap-1.5 text-sm font-medium hover:underline underline-offset-2"
        >
          VELA for Android is live — download the APK now
          <ArrowRight size={13} />
        </a>
      </div>
      <button
        onClick={() => setVisible(false)}
        className="absolute right-4 top-1/2 -translate-y-1/2 text-background/40 transition-colors hover:text-background"
        aria-label="Dismiss banner"
      >
        <X size={14} />
      </button>
    </div>
  );
}

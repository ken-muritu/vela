import Banner from "./components/Banner";
import Navbar from "./components/Navbar";
import Hero from "./components/Hero";
import Problem from "./components/Problem";
import Features from "./components/Features";
import HowItWorks from "./components/HowItWorks";
import Pricing from "./components/Pricing";
import Download from "./components/Download";
import Waitlist from "./components/Waitlist";
import Footer from "./components/Footer";

export default function Home() {
  return (
    <>
      <div className="fixed top-0 left-0 right-0 z-50">
        <Banner />
        <Navbar />
      </div>
      <Hero />
      <Problem />
      <Features />
      <HowItWorks />
      <Pricing />
      <Download />
      <Waitlist />
      <Footer />
    </>
  );
}

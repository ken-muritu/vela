import { ImageResponse } from "next/og";

export const runtime = "edge";
export const alt = "VELA — Catch every thought. Push every action.";
export const size = { width: 1200, height: 630 };
export const contentType = "image/png";

export default async function Image() {
  return new ImageResponse(
    (
      <div
        style={{
          height: "100%",
          width: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          backgroundColor: "#FAFAF7",
          fontFamily: "system-ui, sans-serif",
        }}
      >
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            gap: "24px",
          }}
        >
          <div
            style={{
              fontSize: "24px",
              fontWeight: 600,
              letterSpacing: "0.1em",
              color: "#737373",
            }}
          >
            VELA
          </div>
          <div
            style={{
              fontSize: "64px",
              fontWeight: 600,
              color: "#171717",
              textAlign: "center",
              lineHeight: 1.1,
              maxWidth: "800px",
            }}
          >
            Catch every thought.
          </div>
          <div
            style={{
              fontSize: "64px",
              fontWeight: 600,
              color: "#171717",
              textAlign: "center",
              lineHeight: 1.1,
            }}
          >
            Push every action.
          </div>
          <div
            style={{
              fontSize: "22px",
              color: "#737373",
              marginTop: "16px",
              textAlign: "center",
              maxWidth: "600px",
            }}
          >
            Share from any app. VELA routes your thoughts to the right tools, automatically.
          </div>
        </div>
        <div
          style={{
            position: "absolute",
            bottom: "40px",
            fontSize: "16px",
            color: "#737373",
            letterSpacing: "0.05em",
          }}
        >
          getvela.app
        </div>
      </div>
    ),
    { ...size }
  );
}

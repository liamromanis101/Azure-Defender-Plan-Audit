# Azure-Defender-Plan-Audit
Audits the Azure Defender plan for services to determine if Free or Standard Tier. Using the Free Tier can introduce security weaknesses into your account and subscriptions. 

# Key Risks of Using the Free Tier in Defender for Cloud:
## 1. No Advanced Threat Detection

    Free Tier does not include behavioral analysis or threat intelligence.

    Misses:

        Brute force attacks

        Malware infections

        Suspicious logins

        Advanced persistent threats (APT)

## 2. Limited Coverage by Defender Plans

    Free tier gives only basic recommendations, but no active protections for services like:

        VMs (VirtualMachines)

        AKS (KubernetesService)

        App Services

        ARM (Resource Manager operations)

## 3. No Just-in-Time VM Access

    JIT access protects VMs by reducing their attack surface (by closing ports unless explicitly opened).

    Not available in Free.

## 4. No Adaptive Application Controls

    Helps detect and control what apps can run on your VMs.

    Only available in Standard tier.

## 5. No Network Layer Threat Detection

    NSG flow logs and analysis are not available in Free.

    You miss threat detection for lateral movement and unusual traffic.

## 6. No Integration with Microsoft Defender XDR or Sentinel

    Defender for Cloud (Standard tier) provides enriched alerts and integration with:

        Microsoft Sentinel (SIEM)

        Microsoft Defender for Endpoint

        Microsoft 365 Defender

    These integrations are critical for coordinated threat response.

## 7. Regulatory Gaps

    Free tier may not satisfy security requirements for standards like:

        PCI DSS

        ISO 27001

        HIPAA

    These often require threat detection, log analytics, or vulnerability scanning — all paid-tier features

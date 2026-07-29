# Official Swift Package Manager (SPM) Repository for MeetingLawyersSDK

Welcome to the official SPM repository for MeetingLawyers! This repository hosts the core frameworks and libraries that power our innovative legal services platform. Designed for seamless integration, these packages provide the essential tools and functionalities to enhance your development experience. Stay up-to-date with the latest versions and easily incorporate MeetingLawyers' capabilities into your projects.

## Introduction

This is the official MeetingLawyers iOS SDK. For more information, you can visit [MeetingLawyers](https://www.meetinglawyers.com).


## Swift Package Manager

### Steps for integration:

1. Open Xcode then select `Project` > `Package Dependencies` > `+`
2. Add the repository URL `https://github.com/MeetingLawyers/ios-sdk-spm-meetinglawyers`

### Products

Add one library per Xcode target — each already brings `MeetingLawyersCore` with it:

- `MeetingLawyers` — main SDK, for the app target.
- `MeetingLawyersNSE` — Notification Service Extension, for the extension target.
- `MeetingLawyersCore` — shared core. Add it **only** to link it on its own; the two libraries above
  already include it. It is not re-exported, so `import MeetingLawyersCore` is required to use its APIs.

## Documentation

You can visit the [technical documentation](https://developer.meetinglawyers.com/docs/ios/installation) for more information.

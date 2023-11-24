# Segment Download
Segment Download is a Bash script developed specifically for downloading video segments. I created it specifically to download Online Canvas Lectures as there was no native support for downloading lectures. It will only function when the segments follow the scheme `seg-X-v1-a1.ts`

## Usage
### Prerequisites
- [cURL](https://curl.se/download.html): Make sure you have cURL installed on your system.
- [FFmpeg](https://ffmpeg.org/download.html): Ensure that FFmpeg is installed to concatenate downloaded segments.

### Running the Script
1. Clone the repository:

   ```bash
   git clone https://github.com/wtonk001/segment-download.git
   ```
2. Get the URL for a segment of the video you wish to download.
    - Navigate to the video
    - Open Inspect Element
    - Go to the Network tab
    - Begin playback of the video until you see a url following the format:
        `https://cfvod.kaltura.com/.../a.mp4/seg-X-v1-a1.ts?Policy=...&Signature=...&Key-Pair-Id=...`
3. Execute the command
    ```bash
    ./download.bat "<URL>" [start_segment] [end_segment]
    ```
    - To download the whole video you need to know exactly how many segments the video has. 
    - start_segment begins at 1.

## License
This project is licensed under the MIT License.

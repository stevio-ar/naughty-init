# 🖥️ Windows System Information Spyware

**An educational Windows Batch scripting and light spyware project.**

Explore Windows system diagnostics, file enumeration, PowerShell commands, and Discord webhook integrations.

> ⚠️ **EDUCATIONAL USE ONLY**
>
> Use this project only on computers you own or have explicit authorization to test.

---

## ✨ Features

- 🧑 **User & System Information** — Retrieves the current username, computer name, and execution time.
- 🪟 **Operating System Details** — Collects Windows system information.
- 🌐 **Network Diagnostics** — Records IP configuration, network adapter details, and connectivity test results.
- 💽 **Storage Information** — Retrieves local disk capacity and available space.
- ⚙️ **Process Information** — Lists running processes.
- 📂 **File Inventory** — Records file names and paths from selected user directories.
- 📝 **Text Reports** — Saves collected information in local text files.
- 🔗 **Webhook Integration** — Demonstrates HTTP multipart requests using `curl`.

---

> ⚠️ **Language Issues**
>
> Some of the options on this project could be in Spanish, we're sorry for any confussion.

---

## 📋 Information Collected

| Category | Examples |
|---|---|
| 👤 User | Username and computer name |
| 🪟 System | Windows version and configuration |
| 🌐 Network | IP configuration and MAC addresses |
| 💾 Storage | Disk identifiers, total space, and free space |
| ⚙️ Processes | Running process names and information |
| 📁 Files | File names and paths in selected directories |
| 🕒 Execution | Date and time |

**🔒 Privacy note:** The script lists file names and paths rather than intentionally uploading the contents of every listed file. However, file paths and system information can still contain sensitive or personally identifiable information.

---

## 📁 Generated Reports

| File | Description |
|---|---|
| `data-not.txt` | System, network, storage, connectivity, and process information |
| `files_list.txt` | File names and paths from selected directories |

The script attempts to store its reports in a `SystemLogs` directory under the temporary folder, with a fallback location under Documents.

The system report uses append mode, so information from earlier executions may remain in the file.

---

## 🔗 Discord Webhook Integration

Discord webhooks allow applications to post messages and supported file attachments to a designated channel through HTTP requests.

This project demonstrates the use of `curl` and multipart form data to send a message and submit report files to a configured endpoint.

### 🧪 Safe Testing

For development and testing:

1. Use a private test channel in a server you control.
2. Use a fixed sample message and a dummy text file.
3. Avoid transmitting real system reports or personal file inventories.
4. Check the HTTP response to determine whether the request succeeded.
5. Keep webhook URLs and tokens out of public repositories.

> 🔑 **Webhook security:** Treat a webhook URL as a secret. Anyone who obtains it may be able to post to its associated channel. Revoke and replace exposed webhook URLs.

---

## 🛠️ Requirements

- 💻 Windows
- ⌨️ Windows Command Prompt
- 🔷 PowerShell
- 🌐 `curl`
- 🔌 Internet access for webhook experiments

---

## 🚀 Educational Goals

This project can help learners understand:

- Windows Batch scripting and environment variables.
- PowerShell commands and CIM queries.
- Directory traversal and file enumeration.
- HTTP requests and multipart form data.
- Webhook-based integrations.
- Privacy risks associated with system information collection.

---

## ⚠️ Disclaimer

This software is provided **"AS IS"**, without warranties of any kind, express or implied.

The creator and contributors assume no responsibility or liability for damages, data loss, privacy violations, unauthorized use, or other consequences resulting from the use, misuse, modification, or distribution of this project.

Users are solely responsible for their actions and for complying with applicable laws and regulations.

Nothing in this disclaimer authorizes illegal activity or removes any legal obligations that may apply.

---

## 🛡️ Responsible Use

- ✅ Test only on systems you own or are authorized to assess.
- ✅ Obtain informed permission before collecting system information.
- ✅ Review reports before sharing them.
- ❌ Do not use the project for covert monitoring or unauthorized data collection.
- ❌ Do not publish private reports, credentials, or webhook secrets.

---

## 📌 Project Status

**Status:** Experimental / Educational

This project is intended for learning and experimentation. Behavior may vary depending on the Windows version, system configuration, and available permissions.

---

### 📜 License

Read the `LICENSE` file view the terms under which this project may be used, modified, and distributed.

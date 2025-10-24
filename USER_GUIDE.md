# Universal Tester - Complete User Guide

**Version 1.1.0**

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Quick Start](#quick-start)
4. [Configuration](#configuration)
5. [Using the CLI](#using-the-cli)
6. [Using the Web UI](#using-the-web-ui)
7. [LLM Provider Setup](#llm-provider-setup)
8. [Features](#features)
9. [Troubleshooting](#troubleshooting)
10. [FAQ](#faq)

---

## Introduction

Universal Tester is an AI-powered test generation tool that automatically creates high-quality JUnit tests for Java and Kotlin projects. It uses Large Language Models (LLMs) to understand your code and generate comprehensive test suites with proper mocking, assertions, and edge case coverage.

### Key Features
- ✅ **Multi-LLM Support**: Azure OpenAI, Google Gemini, Ollama
- ✅ **Smart Import Detection**: Automatic dependency analysis
- ✅ **Two Interfaces**: Command-line (CLI) and Web UI
- ✅ **Java & Kotlin**: Full support for both languages
- ✅ **Multiple Frameworks**: JUnit 5, Mockito, MockK, Kotest
- ✅ **Spring Boot Ready**: Special handling for Spring annotations
- ✅ **Incremental Testing**: Generate tests for specific files or entire projects

---

## Installation

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)
- LLM API access (Azure OpenAI, Google Gemini, or Ollama)

### Install from PyPI

```bash
pip install universal-tester
```

This installs everything you need - both CLI and Web UI!

### Verify Installation

```bash
# Check version
universal-tester --version

# Check available commands
universal-tester --help
```

---

## Quick Start

### 1. Set Up Environment Variables

Create a `.env` file in your working directory:

```bash
# For Azure OpenAI
AZURE_OPENAI_API_KEY=your-api-key
AZURE_OPENAI_ENDPOINT=https://your-endpoint.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4
LLM_PROVIDER=azure

# OR for Google Gemini
GOOGLE_API_KEY=your-google-api-key
LLM_PROVIDER=google

# OR for Ollama (local)
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama2
LLM_PROVIDER=ollama
```

### 2. Generate Tests (CLI)

```bash
# Generate tests for a ZIP file
universal-tester --input /path/to/your/java-project.zip

# Specify output directory
universal-tester --input project.zip --output ./generated-tests

# Use specific LLM provider
universal-tester --input project.zip --llm-provider google
```

### 3. Launch Web UI

```bash
# Start the Web UI
universal-tester-ui

# The UI will open at http://localhost:8000
```

Then:
1. Upload your Java/Kotlin project ZIP file
2. Click "Generate Tests"
3. Download the generated test files

---

## Configuration

### Environment Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `LLM_PROVIDER` | LLM provider (`azure`, `google`, `ollama`) | Yes | - |
| `AZURE_OPENAI_API_KEY` | Azure OpenAI API key | If using Azure | - |
| `AZURE_OPENAI_ENDPOINT` | Azure OpenAI endpoint URL | If using Azure | - |
| `AZURE_OPENAI_DEPLOYMENT_NAME` | Azure deployment name | If using Azure | - |
| `AZURE_OPENAI_API_VERSION` | Azure API version | No | `2024-02-15-preview` |
| `GOOGLE_API_KEY` | Google Gemini API key | If using Google | - |
| `OLLAMA_BASE_URL` | Ollama server URL | If using Ollama | `http://localhost:11434` |
| `OLLAMA_MODEL` | Ollama model name | If using Ollama | `llama2` |
| `MAX_RETRIES` | Max retry attempts for LLM calls | No | `3` |
| `RETRY_DELAY` | Delay between retries (seconds) | No | `2` |

### Creating .env File

```bash
# Copy example and edit
cp .env.example .env
nano .env  # or use your favorite editor
```

---

## Using the CLI

### Basic Usage

```bash
universal-tester --input <path-to-zip> [options]
```

### Options

| Option | Description | Example |
|--------|-------------|---------|
| `--input`, `-i` | Input ZIP file path | `-i project.zip` |
| `--output`, `-o` | Output directory | `-o ./tests` |
| `--llm-provider` | LLM provider override | `--llm-provider google` |
| `--language` | Language (java/kotlin) | `--language kotlin` |
| `--framework` | Test framework | `--framework mockk` |
| `--verbose`, `-v` | Verbose output | `-v` |
| `--version` | Show version | `--version` |
| `--help`, `-h` | Show help | `--help` |

### Examples

**Generate tests for Java project:**
```bash
universal-tester -i myproject.zip -o ./generated-tests
```

**Generate tests for Kotlin with MockK:**
```bash
universal-tester -i kotlin-app.zip --language kotlin --framework mockk
```

**Use Google Gemini instead of configured provider:**
```bash
universal-tester -i project.zip --llm-provider google
```

**Verbose mode for debugging:**
```bash
universal-tester -i project.zip -v
```

---

## Using the Web UI

### Starting the UI

```bash
universal-tester-ui
```

The UI will automatically open in your browser at `http://localhost:8000`.

### Web UI Features

1. **File Upload**
   - Drag & drop or click to upload ZIP files
   - Supports Java and Kotlin projects
   - Shows upload progress

2. **LLM Status**
   - Real-time connection status
   - Provider health checks
   - Configuration validation

3. **Test Generation**
   - Click "Generate Tests" button
   - Watch real-time progress
   - View logs and status updates

4. **Download Results**
   - Download generated tests as ZIP
   - Individual file downloads
   - View tests in browser

### UI Commands

While in the UI, you can type commands:

- `/help` - Show available commands
- `/upload` - Upload new file
- `/status` - Check LLM status
- `/version` - Show version info

---

## LLM Provider Setup

### Azure OpenAI Setup

1. **Create Azure OpenAI Resource**
   - Go to Azure Portal
   - Create "Azure OpenAI" resource
   - Note your endpoint URL

2. **Deploy a Model**
   - Deploy `gpt-4` or `gpt-3.5-turbo`
   - Note your deployment name

3. **Get API Key**
   - Navigate to "Keys and Endpoint"
   - Copy Key 1

4. **Configure .env**
   ```bash
   AZURE_OPENAI_API_KEY=your-key-here
   AZURE_OPENAI_ENDPOINT=https://your-resource.openai.azure.com/
   AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4
   LLM_PROVIDER=azure
   ```

### Google Gemini Setup

1. **Get API Key**
   - Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
   - Create API key

2. **Configure .env**
   ```bash
   GOOGLE_API_KEY=your-google-api-key
   LLM_PROVIDER=google
   ```

### Ollama Setup (Local)

1. **Install Ollama**
   ```bash
   # macOS/Linux
   curl https://ollama.ai/install.sh | sh
   
   # Windows: Download from ollama.ai
   ```

2. **Pull a Model**
   ```bash
   ollama pull llama2
   # or
   ollama pull codellama
   ```

3. **Start Ollama Server**
   ```bash
   ollama serve
   ```

4. **Configure .env**
   ```bash
   OLLAMA_BASE_URL=http://localhost:11434
   OLLAMA_MODEL=llama2
   LLM_PROVIDER=ollama
   ```

---

## Features

### Intelligent Test Generation

Universal Tester generates tests with:

- **Proper Setup**: Mock initialization, test data setup
- **Comprehensive Coverage**: Happy path, edge cases, error scenarios
- **Smart Mocking**: Automatic mock creation for dependencies
- **Spring Support**: Handles `@Autowired`, `@Service`, `@Component`
- **Assertions**: JUnit 5 assertions with meaningful messages
- **Exception Testing**: `assertThrows()` for error cases

### Import Detection

Automatically detects and includes:
- JUnit 5 imports (`@Test`, `@BeforeEach`, etc.)
- Mockito imports (`@Mock`, `@InjectMocks`, etc.)
- Spring imports (`@SpringBootTest`, etc.)
- Custom class imports from your project
- Static imports for assertions

### Incremental Testing

Generate tests for:
- **Single files**: Test one class at a time
- **Packages**: Test all classes in a package
- **Full projects**: Generate complete test suite

### Multi-Framework Support

| Language | Frameworks |
|----------|------------|
| Java | JUnit 5, Mockito |
| Kotlin | JUnit 5, MockK, Kotest |

---

## Troubleshooting

### Common Issues

**1. "LLM provider not configured"**
```bash
# Solution: Check your .env file
cat .env
# Ensure LLM_PROVIDER is set correctly
```

**2. "Azure OpenAI authentication failed"**
```bash
# Verify credentials
echo $AZURE_OPENAI_API_KEY
# Re-check endpoint URL (must end with /)
```

**3. "Module 'chainlit' not found"**
```bash
# Reinstall with all dependencies
pip install --upgrade universal-tester
```

**4. "Port 8000 already in use"**
```bash
# Find and kill process using port 8000
# Windows
netstat -ano | findstr :8000
taskkill /PID <pid> /F

# Linux/macOS
lsof -ti:8000 | xargs kill -9
```

**5. "Tests don't compile"**
- Check Java/Kotlin version compatibility
- Verify all dependencies are in your project
- Review generated import statements

### Debug Mode

Enable verbose logging:

```bash
# CLI
universal-tester -i project.zip -v

# Environment variable
export DEBUG=true
universal-tester-ui
```

### Getting Help

1. Check logs in the output directory
2. Run with `--verbose` flag
3. Check LLM provider status: `universal-tester --help`
4. File an issue on GitHub

---

## FAQ

**Q: What LLM providers are supported?**  
A: Azure OpenAI, Google Gemini, and Ollama (local).

**Q: Can I use multiple LLM providers?**  
A: Yes, switch by changing `LLM_PROVIDER` in `.env` or using `--llm-provider` flag.

**Q: What file format should I upload?**  
A: ZIP files containing Java or Kotlin source files (.java, .kt).

**Q: How much does it cost?**  
A: Universal Tester is free and open-source. You only pay for LLM API usage (Azure/Google) or use Ollama locally for free.

**Q: Can I customize test generation prompts?**  
A: Yes, prompts are in `universal_tester/prompts/` directory. You can modify them or create custom ones.

**Q: Does it work with Spring Boot?**  
A: Yes! It has special handling for Spring annotations and dependency injection.

**Q: Can it generate tests for existing test files?**  
A: It's designed for production code. For test files, use it carefully or skip them.

**Q: What Java/Kotlin versions are supported?**  
A: Java 8+, Kotlin 1.8+

**Q: Can I run it in CI/CD?**  
A: Yes! Use the CLI in your build pipeline:
```bash
universal-tester -i project.zip -o tests/ --verbose
```

**Q: How do I update?**  
A:
```bash
pip install --upgrade universal-tester
```

**Q: Is my code sent to external services?**  
A: Code is only sent to the LLM provider you configure. Use Ollama for fully local operation.

---

## Support

- **Documentation**: User Guide (USER_GUIDE.md) and README.md included with package
- **Issues**: Report issues to senthilthepro@hotmail.com
- **Email**: senthilthepro@hotmail.com

---

## License

MIT License - See LICENSE file for details.

---

**Happy Testing! 🚀**

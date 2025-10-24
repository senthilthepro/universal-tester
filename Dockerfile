# Universal Tester - Simple Dockerfile
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV CHAINLIT_HOST=0.0.0.0
ENV CHAINLIT_PORT=8000

# Set working directory
WORKDIR /app

# Install the universal-tester package from PyPI
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir universal-tester

# Copy environment configuration (if exists)
COPY .env* /app/ 2>/dev/null || true

# Expose Chainlit port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/ || exit 1

# Run the UI
CMD ["universal-tester-ui"]

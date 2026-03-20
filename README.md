# 🔊 Audio Signal Processing & Spectral Analysis (MATLAB)

Este proyecto implementa un script en MATLAB para el procesamiento digital y análisis espectral de señales de audio (voz humana). El sistema captura muestras de audio, las procesa matemáticamente y extrae sus características tanto en el dominio del tiempo como en el de la frecuencia utilizando la **Transformada Rápida de Fourier (FFT)**.

## 🚀 Características Principales

* **Análisis Temporal:** Representación gráfica de la amplitud de la señal de voz a lo largo del tiempo, permitiendo identificar silencios, variaciones de intensidad y envolventes acústicas.
* **Análisis Espectral (FFT):** Conversión de la señal al dominio de la frecuencia para visualizar su distribución de energía e identificar las bandas de frecuencia dominantes.
* **Detección de Tono (Pitch Detection):** Algoritmo automatizado para identificar la frecuencia con mayor potencia, permitiendo clasificar el tipo de voz (ej. frecuencias fundamentales de ~100-200 Hz para voces graves, y ~400-450 Hz para voces agudas).
* **Evaluación de Compresión:** Análisis del impacto de algoritmos de compresión con pérdida (como los de WhatsApp o la conversión a MP3) en el espectro de altas frecuencias de la señal original.

## 🧠 Flujo de Procesamiento del Algoritmo

1. **Lectura y Muestreo:** Ingesta del archivo `.mp3` mediante `audioread` y extracción de la Frecuencia de Muestreo ($F_s$).
2. **Segmentación:** Recorte preciso de la señal (windowing) basándose en parámetros de tiempo (inicio y duración) definidos por el usuario para optimizar el coste computacional.
3. **Transformación:** Aplicación de algoritmos propios (`fft_sencilla` y `fft_max`) para procesar el array de datos y extraer la frecuencia máxima.
4. **Visualización:** Generación de gráficas bidimensionales estandarizadas para el análisis técnico.

## 💻 Entorno y Tecnologías

* **Lenguaje:** MATLAB
* **Conceptos Aplicados:** Procesamiento Digital de Señales (DSP), Transformada Rápida de Fourier (FFT), Frecuencia de Nyquist, Análisis Espectral.

## ⚙️ Cómo utilizarlo

1. Clona el repositorio en tu entorno local.
2. Abre MATLAB y navega hasta la carpeta del proyecto.
3. En el archivo `Practica1.m`, modifica la ruta del archivo de entrada en la función `audioread` para apuntar a tu propio archivo de audio:
   ```matlab
   [x, Fs] = audioread('ruta/a/tu/audio.mp3');

% Autor: Adrián Hernández Lillo
% Lectura del fichero de audio
[x, Fs] = audioread('C:\Users\adria\Documents\MATLAB\audios\Audio de WhatsApp Fran.mp3');

% Parámetros definidos por el usuario
t_inicio = 0;  % Segundo donde empieza el análisis
t_duracion = 10; % Duración en segundos a analizar

% Conversión a muestras
muestra_inicio = round(t_inicio * Fs) + 1; % Convertir tiempo a índice
muestra_fin = min(muestra_inicio + round(t_duracion * Fs) - 1, length(x)); % Evitar exceder la señal

% Recorte de la señal
x_recortado = x(muestra_inicio:muestra_fin, :);
t = (0:length(x_recortado)-1) / Fs + t_inicio; % Vector de tiempo ajustado al intervalo

fprintf('Frecuencia de muestreo: %i Hz\n', Fs);
fprintf('Duración total del audio: %f s\n', length(x) / Fs);
fprintf('Analizando desde %.2f s hasta %.2f s\n', t_inicio, t_inicio + t_duracion);

% Figura 1: Señal en el dominio del tiempo
figure(1);
plot(t, x_recortado);
xlabel('Tiempo (s)');
ylabel('Amplitud');
title(sprintf('Señal de audio (%.2f s - %.2f s)', t_inicio, t_inicio + t_duracion));
grid on;
xlim([t_inicio, t_inicio + t_duracion]);

% Figura 2: Transformada de Fourier
figure(2);
fft_sencilla(x_recortado, Fs);
title(sprintf('Transformada de Fourier (%.2f s - %.2f s)', t_inicio, t_inicio + t_duracion));

% Frecuencia con mayor potencia
frecuencia_max = fft_max(x_recortado, Fs);
fprintf('Frecuencia con mayor potencia: %d Hz\n', frecuencia_max);

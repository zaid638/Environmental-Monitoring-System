
#include <stdio.h>
#include <string.h>
#include <curl/curl.h>
#include <stdlib.h>

struct MemoryStruct {
  char *memory;
  size_t size;
};

static size_t WriteMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp) {
  FILE *file = fopen("response.txt", "a");
  if (file == NULL) {
    fprintf(stderr, "Error opening file for writing\n");
    return 0; // Signal an error
  }

  size_t real_size = size * nmemb;
  for (size_t i = 0; i < nmemb; ++i) {
    fprintf(file, "%c", ((char *)contents)[i]);
  }

  fclose(file);

  return nmemb;
}

int main(void) {
  CURL *curl;
  CURLcode result;

  curl = curl_easy_init();
  if (curl == NULL) {
    fprintf(stderr, "Failed to initialize libcurl\n");
    return -1;
  }

  curl_easy_setopt(curl, CURLOPT_URL, "https://api.openweathermap.org/data/2.5/weather?q=Karachi&appid=7b825f37458912ba5b22873e78b1fc33");

  curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);

  result = curl_easy_perform(curl);

  if (result != CURLE_OK) {
    fprintf(stderr, "Error: %s\n", curl_easy_strerror(result));
  }

  curl_easy_cleanup(curl);

  return 0;
}
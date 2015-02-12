/*
 * Copyright 2013- Yan Bonnel
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import com.rometools.fetcher.FeedFetcher;
import com.rometools.fetcher.FetcherException;
import com.rometools.fetcher.impl.HttpURLFeedFetcher;
import com.rometools.rome.feed.synd.SyndCategory;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.stream.Collectors;

public class BloggerToJbake {

    private static final String baseUrl = "http://blog.gilbertoca.com/";
    private static final String bloggerUrl = baseUrl + "/feeds/posts/default?max-results=1000";

    private static final String jbakePath = "/home/gilberto.andrade/tmp/git_working_copy/gilbertoca.com/src/jbake/content/";
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public static void main(String[] args) throws IOException, FetcherException, FeedException {

        FeedFetcher feedFetcher = new HttpURLFeedFetcher();
        SyndFeed feed = feedFetcher.retrieveFeed(new URL(bloggerUrl));
        for (SyndEntry entry : feed.getEntries()) {
            String title = entry.getTitle();
            String type = "post";
            String tags = entry.getCategories().stream().map(SyndCategory::getName)
                    .collect(Collectors.joining(","));
            String status = "published";
            String content = entry.getContents().get(0).getValue();
            String date = dateFormat.format(entry.getPublishedDate());

            Path path = Paths.get(jbakePath, entry.getLink().replace(baseUrl, ""));

            String id = path.getFileName().toString().substring(0, path.getFileName().toString().lastIndexOf("."));
            Files.deleteIfExists(path);
            Files.createDirectories(path.getParent());

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(path.toFile()))) {
                writer.append("title=").append(title).append('\n');
                writer.append("date=").append(date).append('\n');
                writer.append("type=").append(type).append('\n');
                writer.append("tags=").append(tags).append('\n');
                writer.append("status=").append(status).append('\n');
                writer.append("id=").append(id).append('\n');
                writer.append("~~~~~~").append('\n');
                writer.append(content).append('\n');
                writer.flush();
            }

            System.out.println(path);
        }
    }
}

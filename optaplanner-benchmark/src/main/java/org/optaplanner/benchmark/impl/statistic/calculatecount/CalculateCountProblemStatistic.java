/*
 * Copyright 2011 JBoss Inc
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.optaplanner.benchmark.impl.statistic.calculatecount;

import java.awt.BasicStroke;
import java.io.File;
import java.text.NumberFormat;
import java.util.Locale;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.optaplanner.benchmark.config.statistic.ProblemStatisticType;
import org.optaplanner.benchmark.impl.report.BenchmarkReport;
import org.optaplanner.benchmark.impl.result.ProblemBenchmarkResult;
import org.optaplanner.benchmark.impl.result.SingleBenchmarkResult;
import org.optaplanner.benchmark.impl.statistic.ProblemStatistic;
import org.optaplanner.benchmark.impl.statistic.SingleStatistic;
import org.optaplanner.benchmark.impl.statistic.common.MillisecondsSpentNumberFormat;

@XStreamAlias("calculateCountProblemStatistic")
public class CalculateCountProblemStatistic extends ProblemStatistic {

    protected File graphFile = null;

    public CalculateCountProblemStatistic(ProblemBenchmarkResult problemBenchmarkResult) {
        super(problemBenchmarkResult, ProblemStatisticType.CALCULATE_COUNT_PER_SECOND);
    }

    @Override
    public SingleStatistic createSingleStatistic(SingleBenchmarkResult singleBenchmarkResult) {
        return new CalculateCountSingleStatistic(singleBenchmarkResult);
    }

    /**
     * @return never null
     */
    public File getGraphFile() {
        return graphFile;
    }

    // ************************************************************************
    // Write methods
    // ************************************************************************

    @Override
    public void writeGraphFiles(BenchmarkReport benchmarkReport) {
        Locale locale = benchmarkReport.getLocale();
        NumberAxis xAxis = new NumberAxis("Time spent");
        xAxis.setNumberFormatOverride(new MillisecondsSpentNumberFormat(locale));
        NumberAxis yAxis = new NumberAxis("Calculate count per second");
        yAxis.setNumberFormatOverride(NumberFormat.getInstance(locale));
        yAxis.setAutoRangeIncludesZero(false);
        XYPlot plot = new XYPlot(null, xAxis, yAxis, null);
        plot.setOrientation(PlotOrientation.VERTICAL);
        int seriesIndex = 0;
        for (SingleBenchmarkResult singleBenchmarkResult : problemBenchmarkResult.getSingleBenchmarkResultList()) {
            XYSeries series = new XYSeries(singleBenchmarkResult.getSolverBenchmarkResult().getNameWithFavoriteSuffix());
            XYItemRenderer renderer = new XYLineAndShapeRenderer();
            if (singleBenchmarkResult.isSuccess()) {
                CalculateCountSingleStatistic singleStatistic = (CalculateCountSingleStatistic)
                        singleBenchmarkResult.getSingleStatistic(problemStatisticType);
                for (CalculateCountStatisticPoint point : singleStatistic.getPointList()) {
                    long timeMillisSpent = point.getTimeMillisSpent();
                    long calculateCountPerSecond = point.getCalculateCountPerSecond();
                    series.add(timeMillisSpent, calculateCountPerSecond);
                }
            }
            plot.setDataset(seriesIndex, new XYSeriesCollection(series));

            if (singleBenchmarkResult.getSolverBenchmarkResult().isFavorite()) {
                // Make the favorite more obvious
                renderer.setSeriesStroke(0, new BasicStroke(2.0f));
            }
            plot.setRenderer(seriesIndex, renderer);
            seriesIndex++;
        }
        JFreeChart chart = new JFreeChart(problemBenchmarkResult.getName() + " calculate count statistic",
                JFreeChart.DEFAULT_TITLE_FONT, plot, true);
        graphFile = writeChartToImageFile(chart, problemBenchmarkResult.getName() + "CalculateCountStatistic");
    }

}
